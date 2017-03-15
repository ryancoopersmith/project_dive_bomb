import React, { Component } from 'react';

class Bar extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div className="bar_card">
        <img src={this.props.image_url} className="BarCardImage" />
        <p> {this.props.rating} </p>
        <p> {this.props.name}  </p>
        <p id="view_bar"><a href={`bars/${this.props.id}`}>View Bar</a></p>
      </div>
    );
  }
}

export default Bar;
