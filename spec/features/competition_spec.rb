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
  end
end