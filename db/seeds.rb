(Refinery.i18n_enabled? ? Refinery::I18n.frontend_locales : [:en]).each do |lang|
  I18n.locale = lang

  if defined?(Refinery::User)
    Refinery::User.all.each do |user|
      if user.plugins.where(:name => 'refinerycms-image_slideshows').blank?
        user.plugins.create(:name => 'refinerycms-image_slideshows',
                            :position => (user.plugins.maximum(:position) || -1) +1)
      end
    end
  end

end

(Refinery.i18n_enabled? ? Refinery::I18n.frontend_locales : [:en]).each do |lang|
  I18n.locale = lang

  if defined?(Refinery::User)
    Refinery::User.all.each do |user|
      if user.plugins.where(:name => 'refinerycms-image_slides').blank?
        user.plugins.create(:name => 'refinerycms-image_slides',
                            :position => (user.plugins.maximum(:position) || -1) +1)
      end
    end
  end

end
