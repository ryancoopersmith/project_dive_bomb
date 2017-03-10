import BarList from '../src/components/BarList';
import Bar from '../src/components/Bar';

describe('Bar', () => {
  let wrapper;

  beforeEach(() => {
    wrapper = mount(
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
});
