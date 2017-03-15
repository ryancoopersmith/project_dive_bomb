import React, { Component } from 'react';

class Bar extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    let classNames = require('classnames');
    let gridClasses = classNames({
      'card': true,
      'medium-4': true,
      'columns': true
    })

    return (
      <div className={gridClasses}>
        <div className="card-divider">
          <img src={this.props.image_url} className="image" />
          <div className="card-section">
            <div className="info">
              <p> {this.props.name}  </p>
              <p> Rating: {this.props.rating} </p>
              <a href={`bars/${this.props.id}`} className="view">View Bar</a>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default Bar;
