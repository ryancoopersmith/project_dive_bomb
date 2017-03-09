import React, { Component } from 'react';
import Bar from 'Bar'

class BarsList extends Component {
  constructor(props) {
    super(props);
    this.state = {
      bars: []
    }
    this.getData = this.getData.bind(this);
  }

  getData() {
    fetch('http://localhost:4567/api/v1/bars.json')
      .then(response => {
        if (response.ok) {
          return response;
        } else {
          let errorMessage = `${response.status} (${response.statusText})`,
              error = new Error(errorMessage);
          throw(error);
        }
      })
      .then(response => response.json())
      .then(body => {
        console.log(body);
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  componentDidMount() {
    this.getData();
  }

  render() {
    return (
      <Bar />
    )
  }
}

export default BarList;
