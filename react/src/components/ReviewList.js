import React, { Component } from 'react';
import Review from 'Review'

class ReviewList extends Component {
  constructor(props) {
    super(props);
    this.state = {
      reviews: []
    }
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
        this.setState({ reviews: body['reviews'] });
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  componentDidMount() {
    this.getReviews();
  }

  render() {
    if (!this.state.reviews.empty?) {
      let reviews = this.state.reviews.map((review) => {
        return (
          <Review
          id={review.id}
          key={review.key}
          drinks={review.drinks}
          food={review.food}
          entertainment={review.entertainment}
          vibe={review.vibe}
          setting={review.setting}
          description={review.description}
          user_id={review.user_id}
          bar_id={review.bar_id}
          votes={review.votes}
          />
        )
      });

      return(
        {reviews}
      )
      
    } else {
      return (
        <p>Be the first to review!</p>
      )
    }
  }
}

export default ReviewList;
