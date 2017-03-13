import ReviewList from '../src/components/ReviewList';

describe('ReviewList', () => {
  let wrapper;

  beforeEach(() => {
    wrapper = mount(<ReviewList />);
  });

  it('should render a Review Component', () => {
    expect(wrapper.find(Review)).toBePresent();
  });
});
