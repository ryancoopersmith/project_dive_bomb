import React, { Component } from 'react';

class Bar extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <p>{this.props.name}</p>
    )
  }
}

export default Bar;
