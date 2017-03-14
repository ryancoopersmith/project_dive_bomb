import React, { Component } from 'react';

class Bar extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div className="card">
        <div className="card-divider">
          <img src={this.props.image_url} className="image" />
          <div className="card-section">
            <p> {this.props.rating} </p>
            <p> {this.props.name}  </p>
            <p id="view_bar"><a href={`bars/${this.props.id}`}>View Bar</a></p>
          </div>
        </div>
      </div>
    );
  }
}

export default Bar;
