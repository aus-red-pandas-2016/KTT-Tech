require 'spec_helper'

describe Entry do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :body }
  end

  describe '.most_recent' do
    describe 'ordering of entries' do
      before(:each) do
        @older_entry   = Entry.create!(title: "Title 1", body: "Body")
        @younger_entry = Entry.create!(title: "Title 2", body: "Body")
      end

      it 'orders entries most recent first' do
        expect(Entry.most_recent).to eq [@younger_entry, @older_entry]
      end

      it 'orders by created date, not updated date' do
        @older_entry.title = "Updated Title"
        @older_entry.save

        expect(Entry.most_recent).to eq [@younger_entry, @older_entry]
      end
    end

    describe 'number of entries returned' do
      context 'if there are five or more entries' do
        it 'returns only five entries' do
          entry_1 = Entry.create!(title: "Title 1", body: "Body")
          entry_2 = Entry.create!(title: "Title 2", body: "Body")
          entry_3 = Entry.create!(title: "Title 3", body: "Body")
          entry_4 = Entry.create!(title: "Title 4", body: "Body")
          entry_5 = Entry.create!(title: "Title 5", body: "Body")
          entry_6 = Entry.create!(title: "Title 6", body: "Body")

          expect(Entry.most_recent).to match_array [entry_2, entry_3, entry_4, entry_5, entry_6]
        end
      end

      context 'if there are less than five entries' do
        it 'returns all the entries' do
          entry_1 = Entry.create!(title: "Title 1", body: "Body")
          entry_2 = Entry.create!(title: "Title 2", body: "Body")
          entry_3 = Entry.create!(title: "Title 3", body: "Body")

          expect(Entry.most_recent).to eq [entry_3, entry_2, entry_1]
        end
      end
    end
  end

  describe '#stubbed_body' do
    context 'if body has more than twentyfive words' do
      it 'cuts body to first twenty-five words' do
        entry = Entry.create(title: "Title Words", body: "One two three. \"Four five six\" seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen. Seventeen eighteen! Nineteen twenty twentyone twentytwo twentythree twentyfour twentyfive twentysix twentyseven twentyeight twentynine thirty.")
        body_stub = entry.stubbed_body

        expect(body_stub).to eq "One two three. \"Four five six\" seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen. Seventeen eighteen! Nineteen twenty twentyone twentytwo twentythree twentyfour twentyfive ..."
      end
    end

    context 'if body has twentyfive or less words' do
      it 'returns the whole body' do
        entry = Entry.create(title: "Title Words", body: "One two three. \"Four five six\" seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen. Seventeen eighteen! Nineteen twenty twentyone twentytwo twentythree twentyfour twentyfive.")
        body_stub = entry.stubbed_body

        expect(body_stub).to eq entry.body
      end
    end
  end
end
