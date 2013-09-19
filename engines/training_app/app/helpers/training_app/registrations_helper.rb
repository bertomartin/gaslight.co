module TrainingApp::RegistrationsHelper

  def purchased_link(body, url, *options)
    if @registration.present?
      link_to(body, url, link_options)
    else
      button_tag(body)
    end
  end

  def link_options
    { :class => 'button', :target => '_blank' }
  end
end
