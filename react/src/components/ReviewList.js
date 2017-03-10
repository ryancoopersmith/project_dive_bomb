import React, { Component } from 'react';
import Review from 'Review';

class ReviewList extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    let admin = false;
    if (this.props.reviews) {
      let reviews = this.state.reviews.map((review) => {
        if (review.user.admin) {
          admin = true;
        } else {
          admin = false;
        }
        return (
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

      return (
        <div>
          {reviews}
        </div>
      );

    } else {
      return (
        <div>
          Be the first to review!
        </div>
      );
    }
  }
}

export default ReviewList;
