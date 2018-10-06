describe 'Abstract::Object class' do
  before do
    class Foo < Abstract::Object
      @attrs = %i[foo bar]
    end
  end

  context 'instance' do
    it 'expected to respond to :attrs' do
      expect(Abstract::Object.new.respond_to?(:attrs)).to eq true
    end
  end

  context 'subclass' do
    it 'expected to respond to :attrs and return preset list of attrs' do
      expect(Foo.new.respond_to?(:attrs)).to eq true
      expect(Foo.new.attrs).to eq %i[foo bar]
    end
  end
end
