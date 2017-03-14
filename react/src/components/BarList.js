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
    this.updateSearch = this.updateSearch.bind(this);
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
      let bars = this.state.bars.map((bar) => {
        if (bar.name.toLowerCase().indexOf(this.state.search.toLowerCase()) !== -1) {
          return (
            <Bar
              id={bar.id}
              key={bar.id}
              name={bar.name}
              image_url={bar.image_url}
              rating={bar.rating}
            />
          );
        }
      });

      return(
        <div>
          <input type="text" className="search" placeholder="Search"
          value={this.state.search}
          onChange={this.updateSearch}/>
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
