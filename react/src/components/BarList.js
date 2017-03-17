import React, { Component } from 'react';
import Bar from './Bar';

class BarList extends Component {
  constructor(props) {
    super(props);
    this.state = {
      bars: [],
      search: '',
      group: 1
    };
    this.getBars = this.getBars.bind(this);
    this.updateSearch = this.updateSearch.bind(this);
    this.setBars = this.setBars.bind(this);
  }

  updateSearch(event) {
    this.setState({search: event.target.value.substr(0, 20)});
    if (this.state.search.length > 1) {
      this.setState({ group: 0 });
    } else {
      this.setState({ group: 1 });
    }
  }

  getBars() {
    fetch('https://project-dive-bomb.herokuapp.com/api/v1/bars.json')
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

  setBars(page) {
    this.setState({ group: page })
  }

  componentDidMount() {
    this.getBars();
  }

  render() {
    if (this.state.bars) {
      let groupSize = 3;
      let pageSize = 5;
      let bars = this.state.bars.map((bar, index) => {
        if (bar.name.toLowerCase().indexOf(this.state.search.toLowerCase()) !== -1) {
          return (
            <Bar
              id={bar.id}
              key={index + 1}
              name={bar.name}
              address={bar.address}
              description={bar.description}
              image_url={bar.image_url}
              rating={bar.rating}
            />
          );
        }
      }).reduce((r, element, index) => {
        index % groupSize === 0 && r.push([]);
        r[r.length - 1].push(element);
        return r;
      }, []).reduce((r, element, index) => {
        index % pageSize === 0 && r.push([]);
        r[r.length - 1].push(element);
        return r;
      }, []).map((barContent) => {
        if (this.state.group) {
          return(
            <div className="row">
              {barContent[this.state.group - 1]}
            </div>
          );
        } else {
          return(
            <div className="row">
              {barContent}
            </div>
          );
        }
      });

      return(
        <div>
          <input type="text" className="search" placeholder="Search"
          value={this.state.search}
          onChange={this.updateSearch}/>
          {bars}
          <div className="numbers">
            <input type="submit" value="1" className="button" onClick={() => this.setBars(1)} />
            <input type="submit" value="2" className="button" onClick={() => this.setBars(2)} />
            <input type="submit" value="3" className="button" onClick={() => this.setBars(3)} />
            <input type="submit" value="4" className="button" onClick={() => this.setBars(4)} />
            <input type="submit" value="4" className="button" onClick={() => this.setBars(5)} />
          </div>
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
