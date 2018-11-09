describe 'Abstract::Extensions::Object module' do
  before do
    Object.include Abstract::Extensions::Object
  end

  context '.blank?' do
    context 'when self = String.new' do
      it 'String.new.blank? expected to be true' do
        expect(''.blank?).to eq true
      end
    end

    context 'when self = Hash.new' do
      it 'Hash.new.blank? expected to be true' do
        expect({}.blank?).to eq true
      end
    end

    context 'when self = Array.new' do
      it 'Array.new.blank? expected to be true' do
        expect([].blank?).to eq true
      end
    end

    context 'when self = "foo"' do
      it 'foo.blank? expected to be false' do
        expect('foo'.blank?).to eq false
      end
    end

    context "when self = {qwe: 'rty'}" do
      it "{foo: 'bar'}.blank? expected to be false" do
        expect({ foo: 'bar' }.blank?).to eq false
      end
    end

    context "when self = ['foo', 'bar']" do
      it "['foo', 'bar'].blank? expected to be false" do
        expect(%w[foo bar].blank?).to eq false
      end
    end

    context 'when self = Hash' do
      it 'Hash.blank? expected to be false' do
        expect(Hash.blank?).to eq false
      end
    end

    context 'when self = String' do
      it 'String.blank? expected to be false' do
        expect(String.blank?).to eq false
      end
    end

    context 'when self = nil' do
      it 'nil.blank? expected to be true' do
        expect(nil.blank?).to eq true
      end
    end
  end

  context '.default_hash' do
    context '' do
      before do
        @hash_with_default_values = default_hash
        @hash_with_default_values['foo']['bar'] = 'baz'
      end

      it 'non-existent keys expected to be created' do
        expect(@hash_with_default_values).to eq 'foo' => { 'bar' => 'baz' }
      end
    end
  end
end
