<p align="center">
  <picture>
    <source
      media="(prefers-color-scheme: dark)"
      srcset="/assets/kanlinux-banner.png"
    />
    <source
      media="(prefers-color-scheme: light)"
      srcset="/assets/kanlinux-banner.png"
    />
    <img
      src="/assets/kanlinux-banner.png"
      alt="Kan-Linux — a **Simplicity**, **Source‑Built**, **Agent‑First** Linux distro."
      width="1086"
    />
  </picture>
</p>

<!--<h1 align="center">Kan-Linux</h1>-->

<p align="center">
   <a href="/README.md">English</a>  |
   <a href="/docs/README.zh-CN.md">简体中文</a>  |
   <strong>Français</strong> 
</p>

**Kan-Linux** (ou KanLinux) est une distribution Linux **simple**, **construite depuis les sources**, **orientée agent**. Le nom **Kan(勘)** tire son origine des *Instructions pour une vie pratique* de [Wang Yangming](https://fr.wikipedia.org/wiki/Wang_Yangming), et incarne la philosophie de dépasser les obscurités techniques pour revenir à la simplicité originelle du système. Le nom **Kan(勘)** signifie également *voir à travers les illusions et revenir à la simplicité*.

## Principes de conception
- Simplicité — Supprimer les couches d’encapsulation trop complexes et la suringénierie, en suivant la philosophie fondamentale de [ggml/llama.cpp](https://github.com/ggml-org/llama.cpp). Ne dépend d’aucune distribution Linux existante.
- Monodépôt — S’inspirant des distributions Linux existantes et du projet **[Yocto](https://www.yoctoproject.org/)** très élaboré, le projet adopte une architecture de dépôt unique à la manière d’AOSP. L’ensemble du code source est hébergé dans un seul dépôt pour simplifier le développement, la compilation et la maintenance.
- Construit depuis les sources — L’ensemble du système d’exploitation et tous ses composants sont compilés à partir du code source.
- Priorité à llama.cpp — Moteur d’inférence locale llama.cpp natif intégré pour le déploiement de l’IA locale.
- Agent-first et pipeline d’audit de sécurité natif à l’IA — Permet aux agents IA de compiler, déployer, installer des composants, exécuter des contrôles système et résoudre des problèmes de manière autonome. Kan-Linux intègre un audit de sécurité au niveau du code source basé sur les grands modèles de langage (GLM-5.3 et autres) comme étape obligatoire avant la compilation. La sécurité passe de « l’analyse post-compilation des binaires » à l’audit préalable du code source.

## Différences et liens avec Omarchy
- Omarchy s’adresse aux utilisateurs finaux, fournit un système de bureau complet prêt à l’emploi, et le **soin visuel est l’un de ses objectifs principaux**.
- **Kan‑Linux s’adresse aux programmeurs Linux professionnels et aux concepteurs de distributions Linux**, et propose une plateforme graphique Wayland neutre. Ses objectifs principaux sont **la maîtrise**, **l’auditabilité** (aucune boîte noire au sein du système d’exploitation), **la modularité** et **la reproductibilité des compilations** ; le soin visuel n’est pas un objectif du projet.
- Kan‑Linux s'inspire du [shell de bureau d'Omarchy](https://github.com/kan-linux/omarchy) et l'intègre comme notre bureau par défaut optionnel pour cette phase initiale. Nous portons ce shell comme exemple d'interface utilisateur de couche supérieure afin de présenter les capacités de la plateforme Kan-Linux. Même si nous supprimons ou désactivons le shell Omarchy à l'avenir, l'ensemble du système et de l'infrastructure graphique peut continuer à fonctionner de manière complète et indépendante.
- Omarchy repose sur la distribution en amont Arch Linux, tandis que Kan-Linux est construit entièrement à partir de rien et **ne dépend d’aucune distribution Linux en amont**.

## Feuille de route
- Preuve de concept via machine virtuelle QEMU (étape 1, terminée)
- Ajout d’un gestionnaire de connexion et d’un environnement de bureau complet dans la machine virtuelle QEMU (étape 2.1)
- Prise en charge de l’exécution de Kan-Linux sur des ordinateurs de bureau physiques x86-64 (étape 2.2)
- Prise en charge de l’exécution de Kan-Linux sur des ordinateurs portables physiques x86-64 (étape 2.3)
- Ajout d’un agent IA au sein de l’environnement de bureau dans la machine virtuelle QEMU (étape 2.4)
- Activation, test et validation de l’agent IA au sein de l’environnement de bureau sur PC/portables physiques x86-64 (étape 2.5)
- Ordinateurs portables AArch64 (étape 3)

## Récupérer le code

```bash
git clone --recurse-submodules https://github.com/kan-linux/kan.git
```

## Utilisation et captures d’écran
Veuillez consulter https://github.com/kan-linux/iso. Ce dépôt héberge les systèmes de fichiers racine précompilés, les images ISO, les captures d’écran et les guides utilisateur ; ce dépôt principal ne contient que le code source.

## Suivi de sécurité
https://www.debian.org/security/

https://security-tracker.debian.org/tracker/source-package/linux

## Remerciements
- Inspiré par [Omarchy Linux](https://github.com/omacom/omarchy)
- Merci à [LFS (Linux From Scratch)](https://www.linuxfromscratch.org/)
- Merci à [llama.cpp](https://github.com/ggml-org/llama.cpp)
- Merci à l’ensemble de la communauté Linux (divers organismes techniques, comme Redhat(RHEL/Fedora/QEMU), SPI(Debian), Linux Foundation, Linaro, Canonical(Ubuntu), System76(Pop!_OS)... et leurs piles technologiques)
- Remerciement spécial à l’assistant IA pour les nombreuses discussions techniques, conseils d’architecture et aide à la rédaction tout au long du développement de Kan-Linux

## Licence
Ce dépôt de code est publié sous la [licence MIT](LICENSE).

## Citation
Si vous utilisez kan-linux dans vos travaux, veuillez citer :

```bibtex
@misc{kan-linux2026,
  title     = {Kan-Linux : une distribution Linux moderne orientée agent, construite depuis les sources},
  author    = { kan-linux authors et MiMo-V2.5-Pro },
  year      = {2026},
  publisher = {GitHub},
  url       = {https://github.com/kan-linux/kan}
}
```
