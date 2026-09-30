/* SPDX-License-Identifier: MIT */
/*
 * Copyright © 2025 Red Hat, Inc.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice (including the next
 * paragraph) shall be included in all copies or substantial portions of the
 * Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 */

#include "config.h"

#include <errno.h>
#include <stdbool.h>

#include "util-bits.h"
#include "util-io.h"
#include "util-macros.h"
#include "util-mem.h"
#include "util-strings.h"
#include "util-version.h"

#include "eis-proto.h"
#include "libeis-private.h"

static void
eis_text_destroy(struct eis_text *text)
{
	struct eis_client *client = eis_text_get_client(text);
	eis_client_unregister_object(client, &text->proto_object);
}

OBJECT_IMPLEMENT_REF(eis_text);
OBJECT_IMPLEMENT_UNREF_CLEANUP(eis_text);
OBJECT_IMPLEMENT_GETTER_AS_REF(eis_text, proto_object, const struct brei_object *);

static OBJECT_IMPLEMENT_CREATE(eis_text);
static OBJECT_IMPLEMENT_PARENT(eis_text, eis_device);

uint32_t
eis_text_get_version(struct eis_text *text)
{
	return text->proto_object.version;
}

object_id_t
eis_text_get_id(struct eis_text *text)
{
	return text->proto_object.id;
}

struct eis_device *
eis_text_get_device(struct eis_text *text)
{
	return eis_text_parent(text);
}

struct eis_client *
eis_text_get_client(struct eis_text *text)
{
	return eis_device_get_client(eis_text_get_device(text));
}

struct eis *
eis_text_get_context(struct eis_text *text)
{
	struct eis_client *client = eis_text_get_client(text);
	return eis_client_get_context(client);
}

const struct eis_text_interface *
eis_text_get_interface(struct eis_text *text)
{
	return eis_device_get_text_interface(eis_text_get_device(text));
}

struct eis_text *
eis_text_new(struct eis_device *device)
{
	struct eis_text *text = eis_text_create(&device->object);
	struct eis_client *client = eis_device_get_client(device);

	text->proto_object.id = eis_client_get_new_id(client);
	text->proto_object.implementation = text;
	text->proto_object.interface = &eis_text_proto_interface;
	text->proto_object.version = client->interface_versions.ei_text;
	list_init(&text->proto_object.link);

	eis_client_register_object(client, &text->proto_object);

	return text; /* ref owned by caller */
}
