import React, { Component } from 'react';
import ReviewList from './ReviewList'

class Bar extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    if (this.props.reviews) {
      return (
        <ReviewList
        reviews={this.props.reviews}
        />
      );
    }
  }
}

export default Bar;
