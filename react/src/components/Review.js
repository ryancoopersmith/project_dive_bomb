import React, { Component } from 'react';

class Review extends Component {
  constructor(props) {
    super(props);
    this.state = {
      votes: [];
    }
    this.setVotes = this.setVotes.bind(this);
  }

  componentDidMount() {
    this.setVotes();
  }

  render() {
    return (
      <div>
        {this.props.votes}
      <div>
    )
  }
}

export default Review;
