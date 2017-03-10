import React, { Component } from 'react';

class Bar extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    let name = this.props.name;
    return (
      <div>
        {name}
      </div>
    );
  }
}

export default Bar;
