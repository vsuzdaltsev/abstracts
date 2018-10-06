describe 'Abstract::Builder class' do
  before do
    class FooObject < Abstract::Object
      @attrs = %i[foo bar]
    end

    class FooBuilder < Abstract::Builder
      @build_class = 'FooObject'
    end
  end

  context '.build' do
    it 'expected to respond to build' do
      expect(FooBuilder.respond_to?(:build)).to eq true
    end
  end

  context 'subclass.build' do
    it 'expected to return an instance of a class defined by @build_class' do
      expect(FooBuilder.build).to be_an_instance_of FooObject
    end
  end
end
