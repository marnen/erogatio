require 'rails_helper'

RSpec.describe WorkUnit, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :client }
    it { is_expected.to have_one(:user).through(:client) }
    it { is_expected.to have_many :payments }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :client_id }
    it { is_expected.to validate_presence_of :date }
    it { is_expected.to validate_presence_of :hours }
  end

  describe '.permitted_params' do
    include_examples 'permit content columns' do
      let(:match) { :include }
    end

    subject { described_class.permitted_params }

    it { is_expected.to include 'client_id' }
    it { is_expected.to include 'decimal_hours' }
  end

  context 'decimal hours' do
    shared_context 'integral number of hours' do
      let(:hours) { rand(2..10) }
    end

    shared_context 'fractional number of hours' do
      let(:hours) { rand(200..1000) / 100.0 }
    end

    describe '#decimal_hours' do
      let(:work_unit) { FactoryBot.create :work_unit, hours: hours.hours }

      subject { work_unit.decimal_hours }

      shared_examples 'return float' do
        it 'returns the hours as a float' do
          expect(subject).to eql hours.to_f
        end
      end

      context 'integral number of hours' do
        include_context 'integral number of hours'
        include_examples 'return float'
      end

      context 'fractional number of hours' do
        include_context 'fractional number of hours'
        include_examples 'return float'
      end
    end

    describe '#decimal_hours=' do
      let(:work_unit) { described_class.new decimal_hours: hours }

      shared_examples 'set hours' do
        it 'sets hours to the given number' do
          expect(work_unit.hours).to eql hours.hours
        end

        context 'hours is a string' do
          let(:hours) { super().to_s }

          it 'sets hours to the given number, converted to a duration' do
            expect(work_unit.hours).to be == hours.to_f.hours
          end
        end
      end

      context 'integral number of hours' do
        include_context 'integral number of hours'
        include_examples 'set hours'
      end

      context 'fractional number of hours' do
        include_context 'fractional number of hours'
        include_examples 'set hours'
      end
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
