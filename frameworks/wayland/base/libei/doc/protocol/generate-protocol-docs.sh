#!/usr/bin/env bash
#
set -e

REPO_BASE_DIR="$PWD"

OUTDIR="$PWD"
SITENAME="ei"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --verbose | -v)
      set -x
      shift
      ;;
    --scanner)
      SCANNER="$2"
      shift 2;
      ;;
    --protocol)
      PROTOFILE="$2"
      shift 2
      ;;
    --template-dir)
      TEMPLATEDIR="$2"
      shift 2
      ;;
    --output-dir)
      OUTDIR="$2"
      shift 2
      ;;
    --git-repo)
      REPO_BASE_DIR="$2"
      shift 2;
      ;;
    **)
      echo "Unknown argument: $1"
      exit 1
      ;;
  esac
done

if [[ -z "$SCANNER" ]]; then
  SCANNER="$REPO_BASE_DIR/proto/ei-scanner"
fi

if [[ -z "$PROTOFILE" ]]; then
  PROTOFILE="$REPO_BASE_DIR/proto/protocol.xml"
fi

if [[ -z "$TEMPLATEDIR" ]]; then
  TEMPLATEDIR="$REPO_BASE_DIR/doc/protocol/"
fi

SITEDIR="$OUTDIR/$SITENAME"
if [[ -e "$SITEDIR" ]]; then
  echo "$SITEDIR already exists, updating"
else
  hugo new site "$SITEDIR"
  git clone --depth=1 https://github.com/McShelby/hugo-theme-relearn "$SITEDIR/themes/hugo-theme-relearn"
fi

cp "$TEMPLATEDIR/hugo.toml" "$SITEDIR/"

pushd "$TEMPLATEDIR" > /dev/null || exit 1
find . -type f -name "*.md"
find . -type f -name "*.md" -exec install -D {} "$SITEDIR/content/{}" \;
popd > /dev/null || exit 1

pushd "$SITEDIR" > /dev/null || exit 1

# Generate a list of available interfaces and read that
# list line-by-line to generate a separate .md file
# for each interface
while read -r iface; do
  $SCANNER --component=ei --jinja-extra-data="{ \"interface\": \"$iface\" }" --output="$SITEDIR/content/interfaces/$iface.md" "$PROTOFILE" "$TEMPLATEDIR/interface.md.tmpl"
done < <($SCANNER --component=ei "$PROTOFILE" - <<EOF
{% for interface in interfaces %}
{{interface.name}}
{% endfor %}
EOF
)

hugo

popd > /dev/null || exit 1
