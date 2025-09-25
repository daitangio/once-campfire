require "nokogiri"

class Account < ApplicationRecord
  include Joinable

  has_one_attached :logo

  before_save :sanitize_custom_styles

  private
    def sanitize_custom_styles
      return unless will_save_change_to_custom_styles?

      self.custom_styles = sanitized_custom_styles(custom_styles)
    end

    def sanitized_custom_styles(styles)
      return if styles.blank?

      fragment = Nokogiri::HTML::DocumentFragment.parse(styles.to_s)
      fragment.css("script, iframe, object, embed").remove
      fragment.text.strip
    end
end
