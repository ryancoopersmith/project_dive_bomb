import BarList from '../src/components/BarList';

describe('BarList', () => {
  let wrapper;

  beforeEach(() => {
    wrapper = mount(<BarList />);
  });

  it('should render a Bar Component', () => {
    expect(wrapper.find(Bar)).toBePresent();
  });
});
