import React, { Component } from 'react';

class Bar extends Component {
  constructor(props) {
    super(props);
    this.state = {
      description: ''
    };
    this.shortenDescription = this.shortenDescription.bind(this);
  }

  shortenDescription(description) {
    let descriptionArray = description.split('');
    let shortenedDescriptionArray = descriptionArray.slice(0, 135)
    let shortenedDescription = shortenedDescriptionArray.join('');
    this.setState({ description: shortenedDescription.concat('...') });
  }

  componentDidMount() {
    this.shortenDescription(this.props.description);
  }

  render() {
    let classNames = require('classnames');

    let gridClasses = classNames({
      'card': true,
      'medium-4': true,
      'columns': true
    })

    let viewClasses = classNames({
      'hollow': true,
      'button': true,
      'defcon-5': true
    })

    return (
      <div className={gridClasses}>
        <div className="card-divider">
          <img src={this.props.image_url} className="image" />
          <div className="card-section">
            <div className="info">
              <h4> {this.props.name}  </h4>
              <h5> Rating: {this.props.rating} 💣 </h5>
              <h6> {this.props.address} </h6>
              <p>{this.state.description} </p>
              <a href={`bars/${this.props.id}`} className={viewClasses}>View Bar</a>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default Bar;
