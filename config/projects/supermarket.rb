#
# Copyright 2014 Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

name "supermarket"
maintainer "Chef Supermarket Team <supermarket@getchef.com>"
homepage "https://supermarket.getchef.com"

# Defaults to C:/supermarket on Windows
# and /opt/supermarket on all other platforms
install_dir "#{default_root}/#{name}"

build_version do
  source :git, from_dependency: 'supermarket'
  output_format :semver
end
build_iteration 1

override :cacerts, version: '2014.08.20'
override :postgresql, version: '9.3.6'
override :ruby, version: "2.1.6"
override :rubygems, version: "2.4.1"
override :git, version: "2.2.1"
override :chef, version: '12.3.0'

# Creates required build directories
dependency "preparation"

# supermarket dependencies/components
dependency "supermarket"
dependency "supermarket-cookbooks"
dependency "supermarket-ctl"

# Version manifest file
dependency "version-manifest"

exclude "**/.git"
exclude "**/bundler/git"
