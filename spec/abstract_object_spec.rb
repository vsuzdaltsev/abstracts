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
    it 'expected to respond to :attrs and return list of attrs preset via @attrs' do
      expect(Foo.new.respond_to?(:attrs)).to eq true
      expect(Foo.new.attrs).to eq %i[foo bar]
    end
  end

  context 'subclass' do
    it 'expected to respond to each of attr_accessors preset via @attrs' do
      Foo.new.attrs.each do |attr_accessor|
        expect(Foo.new.respond_to?(attr_accessor)).to eq true
        expect(Foo.new.respond_to?("#{attr_accessor}=")).to eq true
      end
    end
  end
end
