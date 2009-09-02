module FacebookController
  def self.included(controller)
    controller.class_eval do
      index.wants.fbml {}
      show.wants.fbml {}
    end
  end
end