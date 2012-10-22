require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe 'Significance' do

  describe Object do

    describe 'Basic check for methods being available' do

      it { should respond_to :significant? }
      it { should respond_to :significant }
      it { should respond_to :keep_significant }
      it { should respond_to :significant! }
      it { should respond_to :significance }
      it { should respond_to :significant_significance }
      it { should respond_to :significant_significance? }
    end

    describe '#significant?' do
      it { should be_significant }
    end

    describe '#significant' do
      it 'returns self' do
        subject.significant.should be subject
      end
    end

    describe '#keep_significant' do
      it 'returns self' do
        subject.should_not respond_to :replace
        subject.keep_significant.should be subject
      end
    end

    describe '#significant!' do
      it 'is an alias for #keep_significant' do
        subject.should_receive(:keep_significant)
        subject.significant!
      end
    end

    describe '#significant_significance' do
      before(:each) do
        significant = mock('significant')
        subject.should_receive(:significant).and_return(significant)
        significant.should_receive(:significance)
      end

      it 'chain-calls #significant and #significance' do
        subject.significant_significance
      end

      it 'is aliased to #sigsig' do
        subject.sigsig
      end
    end

    describe '#significant_significance?' do
      before(:each) do
        sigsig = mock('sigsig')
        subject.should_receive(:significant_significance).and_return(sigsig)
        sigsig.should_receive(:significant?)
      end

      it 'chain-calls #significant_significance and #significant?' do
        subject.significant_significance?
      end

      it 'is aliased as #sigsig?' do
        subject.sigsig?
      end
    end
  end

  describe false do
    it { should be_significant }
  end

  describe String do

    describe '#significant' do
      it 'strips whitespaces on either end' do
        subject.should_receive(:strip)
        subject.significant
      end
    end

    describe '#strictly_significant' do
      it 'removes all whitespaces within' do
        subject.should_receive(:gsub).with(/\s+/, '')
        subject.strictly_significant
      end
    end
  end

  describe Array do
    let(:element) { mock('el', :significant_significance? => true) }
    subject { [element, element] }
    describe '#significant' do

      it 'calls #significant_significance? on each element' do
        element.should_receive(:significant_significance?).twice
        subject.significant
      end

      it 'calls #significant on the filtered elements' do
        element.should_receive(:significant).twice.and_return(element)
        subject.significant.should =~ [element, element]
      end
    end
  end

  describe Set do

  end

  describe Hash do

    describe '#significant' do

      it 'returns a new Hash' do
        subject.significant.should_not be subject
      end

      it 'calls #significance_each_block on each' do
        # hsh.stub(:significance_each_block).and_return(Proc.new { |x| x.to_s })
        subject.should_receive(:each)#.with(kind_of(Proc))
        subject.significant
      end
    end

    let(:other_hash) { mock('other_hash') }

    describe '#significant_merge' do

      context 'when other hash is empty' do
        before { other_hash.stub(:significant => {}) }

        it 'returns self' do
          subject.significant_merge(other_hash).should be subject
        end
      end

      context 'when other hash is significant' do
        before { other_hash.stub(:significant => other_hash,
                                 :present? => true) }

        it 'calls merge with #significant on other hash' do
          other_hash.should_receive(:significant).twice
          subject.should_receive(:merge).with(other_hash)
          subject.significant_merge(other_hash)
        end
      end
    end

    describe '#significant_merge!' do

      context 'when other hash is empty' do
        before { other_hash.stub(:significant => {}) }

        it 'returns self' do
          subject.significant_merge!(other_hash).should be subject
        end
      end

      context 'when other hash is significant' do
        before { other_hash.stub(:significant => other_hash,
                                 :present? => true) }

        it 'calls merge! with #significant on other hash' do
          other_hash.should_receive(:significant).twice
          subject.should_receive(:merge!).with(other_hash)
          subject.significant_merge!(other_hash)
        end
      end
    end

    describe '#reverse_significant_merge' do

      context 'when other hash is empty' do
        it 'returns self' do
          other_hash.stub(:merge => :merged_hash)
          subject.reverse_significant_merge(other_hash).should be :merged_hash
        end
      end

      context 'when other hash is significant' do
        before { other_hash.stub(:significant => other_hash,
                                 :present? => true) }

        it 'calls merge with #significant on other hash' do
          subject.should_receive(:significant).and_return(subject)
          subject.should_receive(:reverse_merge).with(other_hash)
          subject.reverse_significant_merge(other_hash)
        end
      end
    end

    describe '#reverse_significant_merge!' do

      context 'when other hash is empty' do
        it 'returns self' do
          subject.stub(:merge! => :merged_hash)
          subject.reverse_significant_merge!(other_hash).should be :merged_hash
        end
      end

      context 'when other hash is significant' do
        before { other_hash.stub(:significant => other_hash,
                                 :present? => true) }

        it 'calls merge with #significant on other hash' do
          subject.should_receive(:significant).and_return(subject)
          subject.should_receive(:reverse_merge!).with(other_hash)
          subject.reverse_significant_merge!(other_hash)
        end
      end
    end
  end
end
