# foreman_resources

A lot of my Puppet classes use the create\_resources function to create
resources on the server. For instance my apache class uses this function
to manage vhosts and the sudo class manages the the sudoers entries. The
resouces are passed to the class via a parameter, which contains a hash
with the resources.

As I use foreman as my ENC, I want to be able to use the parameterized
classes of foreman. Foreman can validate basic types like strings and
booleans, but has no mechanism for validating YAML or JSON fields.
This is where this plugin comes in.

Resources for the Puppet classes are described in a JSON-schema. Parameters
are validated against this schema before they are commited to the
lookup\_values table. Lookup values are stored with a fqdn=hostname match.

Resources are accessable only via an API at this moment. See *usage* for
the API calls.

# See also:

JSON schema: <http://json-schema.org>

# Installation:

Add a file to the bundler.d directory of foreman:

*/bundler.d/resources.rb*

    gem 'json-schema'
    gem 'foreman_resources', :path => '/usr/share/foreman_resources'

Next, as a Foreman user (not root), run the following command:

    $ bundle install

Copy your [resources.json](examples/resources.json) to the
[foreman\_root]/public/resources.json. In the examples directory is
a sample resources.json which can be used with the
[sudo](https://github.com/arnoudj/puppet-sudo) class.

# Usage

The following API calls are added to the foreman API to manage the
resources.

## GET /api/hosts/:host\_id/puppetclasses/:puppetclass\_id/types

Returns a JSON array of all the resource types known for this puppetclass.

### Example

    GET /api/hosts/host01.example.com/puppetclasses/apache/types
    200
    ["vhosts", "modules"]

## GET /api/hosts/:host\_id/puppetclasses/:puppetclass\_id/types/:id

Returns a JSON hash with all the resources of this resource type.

### Example

    GET /api/hosts/host01.example.com/puppetclasses/apache/types/vhosts
    200
    [ "www.example.com", "secure.example.com" ]

## GET /api/hosts/:host\_id/puppetclasses/:puppetclass\_id/types/:type\_id/resources

Returns a JSON hash with all the resources of this resource type.

### Example

    GET /api/hosts/host01.example.com/puppetclasses/apache/types/vhosts/resources
    200
    {
      "www.example.com": {
        "documentroot": "/var/www/www.example.com",
        "user":         "www-data"
      },
      "secure.example.com": {
        "documentroot": "/var/www/www.example.com",
        "user":         "www-data"
      }
    }

## GET /api/hosts/:host\_id/puppetclasses/:puppetclass\_id/types/:type\_id/resources/:id

Returns a JSON hash with the data for the resource.

### Example

    GET /api/hosts/host01.example.com/puppetclasses/apache/types/vhosts/resources/www.example.com
    200
    {
        "documentroot": "/var/www/www.example.com",
        "user":         "www-data"
    }

## POST /api/hosts/:host\_id/puppetclasses/:puppetclass\_id/types/:type\_id/resources/:id

Update the data for the resource. If the resource does not exist, it will be created.

### Example

    POST /api/hosts/host01.example.com/puppetclasses/apache/types/vhosts/resources/www.example.com
    {
        "documentroot": "/var/www/www.example.com",
        "user":         "www-data"
    }
    200
    {
        "documentroot": "/var/www/www.example.com",
        "user":         "www-data"
    }

## DELETE /api/hosts/:host\_id/puppetclasses/:puppetclass\_id/types/:type\_id/resources/:id

Delete a resource. The data of the deleted resource is returned as JSON.

### Example

    DELETE /api/hosts/host01.example.com/puppetclasses/apache/types/vhosts/resources/www.example.com
    200
    {
        "documentroot": "/var/www/www.example.com",
        "user":         "www-data"
    }

# Copyright

Copyright (c) 2013 Arnoud de Jonge, Nxs Internet B.V.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
