import React, { Component } from 'react';
import Bar from './Bar'

class BarsList extends Component {
  constructor(props) {
    super(props);
    this.state = {
      bars: []
    }
    this.getBars = this.getBars.bind(this);
  }

  getBars() {
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
        this.setState({ bars: body.bars });
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  componentDidMount() {
    this.getBars();
  }

  render() {
    if (this.state.bars) {
      let bars = this.state.bars.map((bar) => {
        return (
          <Bar
            id={bar.id}
            key={bar.id}
            name={bar.name}
            url={bar.url}
            address={bar.address}
            city={bar.city}
            state={bar.state}
            zip={bar.zip}
            phone_number={bar.phone_number}
            image_url={bar.image_url}
            rating={bar.rating}
            description={bar.description}
          />
        );
      });

      return(
        <div>
          {bars}
        </div>
      );

    } else {
      return (
        <div>
          Be the first to reccomend a bar!
        </div>
      );
    }
  }
}

export default BarList;
