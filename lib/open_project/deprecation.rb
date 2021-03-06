#-- copyright
# OpenProject is an open source project management software.
# Copyright (C) 2012-2021 the OpenProject GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License version 3.
#
# OpenProject is a fork of ChiliProject, which is a fork of Redmine. The copyright follows:
# Copyright (C) 2006-2013 Jean-Philippe Lang
# Copyright (C) 2010-2013 the ChiliProject Team
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
# See docs/COPYRIGHT.rdoc for more details.
#++

module OpenProject::Deprecation
  class << self
    def deprecator
      @@deprecator||= ActiveSupport::Deprecation.new('in a future major upgrade', 'OpenProject')
    end

    ##
    # Deprecate the given method with a notice regarding future removal
    def deprecate_method(mod, method)
      deprecator.deprecate_methods(mod, method)
    end

    def replaced(old_method, new_method, called_from)
      ActiveSupport::Deprecation.warn "#{old_method} is deprecated and will be removed in a future OpenProject version. Please use #{new_method} instead.", called_from
    end
  end
end
