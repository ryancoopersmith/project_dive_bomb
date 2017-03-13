import React, { Component } from 'react';
import Review from './Review';

class ReviewList extends Component {
  constructor(props) {
    super(props);
    this.state = {
      reviews: []
    };
    this.getReviews = this.getReviews.bind(this);
  }

  getReviews() {
    fetch('http://localhost:4567/api/v1/reviews.json')
      .then(response => {
        if (response.ok) {
          return response;
        } else {
          let errorMessage = `${response.status} (${response.statusText})`,
              error = new Error(errorMessage);
          throw(error);
        }
      })
      .then(response => response.json())
      .then(body => {
        let barReviews = [];
        body.reviews.foreach((review) => {
          if (this.props.location.query.bar_id === review.bar_id) {
            barReviews.push(review);
          }
        });
        this.setState({ reviews: barReviews });
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  componentDidMount() {
    this.getReviews();
  }

  render() {
    let admin = false;
    if (this.state.reviews) {
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
