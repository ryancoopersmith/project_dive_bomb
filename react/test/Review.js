import Review from '../src/components/Review';
import ReviewList from '../src/components/ReviewList'

describe('Review', () => {
  let wrapper;

  beforeEach(() => {
    wrapper = mount(
      <Review
        id={review.id}
        key={review.id}
        drinks={review.drinks}
        food={review.food}
        entertainment={review.entertainment}
        vibe={review.vibe}
        setting={review.setting}
        description={review.description}
        user_id={review.user_id}
        upvotes={review.upvotes}
        downvotes={review.downvotes}
        admin={admin}
      />
    );
  });
});
