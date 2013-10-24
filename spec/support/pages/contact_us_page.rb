class ContactUsPage
  include Capybara::DSL

  def visit_page
    visit '/contact'
  end

  def open_modal
    click_on("few quick questions")
  end

  def complete_form
    fill_in 'Name', with: 'Chris Moore'
    fill_in 'Email', with: 'chris@cdmwebs.com'
    fill_in 'Can you tell us a little bit about your business and project?', with: 'This is a comment. It might be a question, though.'
    fill_in 'Are you a human? Just say yes if so.', with: 'Yeah'
  end

  def submit
    click_button 'Send it!'
  end

  def successful?
    page.current_path == '/contact' && page.has_content?("got it!")
  end
end

