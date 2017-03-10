import React, { Component } from 'react';

class Review extends Component {
  constructor(props) {
    super(props);
    this.state = {
      votes: []
    }
    this.setVotes = this.setVotes.bind(this);
  }

  componentDidMount() {
    this.setVotes();
  }

  render() {
    return (
      <p>{this.props.votes}<p>
    )
  }
}

export default Review;
