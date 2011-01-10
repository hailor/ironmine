# -*- coding: utf-8 -*-
module Irm::MenusHelper
 def available_menus
   Irm::Menu.enabled.multilingual
 end
end