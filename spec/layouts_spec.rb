require 'layouts'

RSpec.describe 'LAYOUTS' do
  LAYOUTS.each do |layout|
    describe "#{layout.name} keyboard" do
      let(:mapping) { layout.instance_variable_get('@mapping') }

      it 'has 19 initial consonants' do
        expect(mapping).to have_key('initial')
        expect(mapping['initial'].size).to be(19)
      end

      it 'has 21 medial consonants' do
        expect(mapping).to have_key('medial')
        expect(mapping['medial'].size).to be(21)
      end

      it 'has 27 final consonants' do
        expect(mapping).to have_key('final')
        expect(mapping['final'].size).to be(27)
      end
    end
  end
end
