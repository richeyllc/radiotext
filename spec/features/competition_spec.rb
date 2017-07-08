require 'rails_helper'

describe 'navigate' do
  before do
    @competition = Competition.create(title: "First Competition", keyword: 'FIRSTCOMP')
  end
  describe 'index' do
    it 'can be reached successfully' do
      visit competitions_path
      expect(page.status_code).to eq(200)
    end
    
    it 'renders the list of topics' do
      Competition.create(title: "Second Competition", keyword: 'SECONDCOMP')
      visit competitions_path
      expect(page).to have_content(/FIRSTCOMP|SECONDCOMP/)
    end
    
    it 'has links to all the competition show pages' do
      visit competitions_path
      expect(page).to have_link(@competition.title, href: competition_path(@competition))
    end
  end
  
  describe 'show' do
    it 'can be reached successfully' do
      visit competition_path(@competition)
      expect(page.status_code).to eq(200)
    end
    
    it 'should displat competition title and keyword' do
      visit competition_path(@competition)
      expect(page).to have_css('h1', text: 'First Competition')
      expect(page).to have_css('h2', text: 'FIRSTCOMP')
    end
  end
  
  describe 'form' do
    it 'can be reached successfully when navigating to the /new path' do
      visit new_competition_path
      expect(page.status_code).to eq(200)
    end
    
    it 'allows users to create a new competition from the /new page' do
      visit new_competition_path
      
      fill_in 'competition[title]', with: "Third Competition"
      fill_in 'competition[keyword]', with: 'THIRDCOMP'
      
      click_on "Save"
      
      expect(page).to have_content("Third Competition")
    end
    
    it 'allows users to update an existing competition from the /edit page' do
      visit edit_competition_path(@competition)
      
      fill_in 'competition[title]', with: 'Updated Competition'
      
      click_on "Save"
      
      expect(page).to have_content("Updated Competition")
    end
  end
end