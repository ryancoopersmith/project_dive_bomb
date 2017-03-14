import React, { Component } from 'react';
import Bar from './Bar';

class BarList extends Component {
  constructor(props) {
    super(props);
    this.state = {
      bars: [],
      search: ''
    };
    this.getBars = this.getBars.bind(this);
  }

  updateSearch(event) {
    this.setState({search: event.target.value.substr(0, 20)});
  }

  getBars() {
    fetch('http://localhost:3000/api/v1/bars.json')
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
        this.setState({ bars: body });
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  componentDidMount() {
    this.getBars();
  }

  render() {
    if (this.state.bars) {
      let filteredBars = this.state.bars.filter(
        (bar) => {
          return bar.name.toLowerCase().indexOf(this.state.search.toLowerCase()) !== -1;
        }
      );
      let unfilteredBars = this.state.bars.map((bar) => {
        return (
          <Bar
            id={bar.id}
            key={bar.id}
            name={bar.name}
            image_url={bar.image_url}
            rating={bar.rating}
          />
        );
      });

      let bars = filteredBars.map((bar) => {
        return bar;
      })

      return(
        <div>
          <input type="text"
          value={this.state.search}
          onChange={this.updateSearch.bind(this)}/>
          {bars}
        </div>
      );

    } else {
      return (
        <div>
          Be the first to recommend a bar!
        </div>
      );
    }
  }
}

export default BarList;
