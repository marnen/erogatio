require 'rails_helper'

RSpec.describe WorkUnit, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to have_many :payments }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :date }
    it { is_expected.to validate_presence_of :hours }
    it { is_expected.to validate_presence_of :user_id }
  end

  describe '.permitted_params' do
    it 'includes all the content field names except the timestamps' do
      expect(WorkUnit.permitted_params).to contain_exactly *WorkUnit.content_columns.map(&:name).reject {|name| name.ends_with? '_at' }
    end
  end

  describe '#paid?' do
    let(:work_unit) { FactoryBot.create :work_unit }
    subject { work_unit.paid? }

    context 'no payments' do
      it { is_expected.to be false }
    end

    context 'one payment for the full amount' do
      before(:each) { FactoryBot.create :payment, work_unit: work_unit, amount: work_unit.pay }
      it { is_expected.to be true }
    end
  end
end
