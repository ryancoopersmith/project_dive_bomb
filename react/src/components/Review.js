import React, { Component } from 'react';

class Review extends Component {
  constructor(props) {
    super(props);
    this.state = {
      upvotes: 0,
      downvotes: 0
    };
    this.setVotes = this.setVotes.bind(this);
  }

  componentDidMount() {
    this.setVotes();
  }

  setVotes() {
    this.setState({
      upvotes: this.props.upvotes,
      downvotes: this.props.downvotes
    });
  }

  render() {
    let votes = this.state.upvotes + this.state.downvotes;
    return (
      <div>
        <p> {this.state.upvotes} out of {votes} people agreed with this review </p>
      </div>
    );
  }
}

export default Review;
