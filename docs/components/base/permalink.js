import React from 'react';
import PermalinkIcon from '~/components/icons/permalink-icon';
import * as Constants from '~/style/constants';
import generateSlug from '~/components/base/generate-slug';

class Permalink extends React.Component {
  render() {
    const { component, className, children, ...rest } = this.props;
    return React.cloneElement(
      component,
      {
        className: [className, component.props.className || ''].join(' '),
        ...rest,
      },
      children
    );
  }
}

const fn = props => {
  const component = props.children;
  const children = component.props.children || '';
  let id = props.id;

  if (id == null) {
    id = generateSlug(children);
  }

  return (
    <Permalink component={component} data-components-heading>
      <div className="container">
        <span id={id} className="target" />
        <a href={'#' + id} className="permalink">
          <PermalinkIcon />
        </a>
        <div style={{ lineHeight: '1.5em' }}>{children}</div>
      </div>

      <style jsx>
        {`
          a {
            color: inherit;
            margin-right: 5px;
            text-decoration: none;
          }

          .container {
            margin-left: -20px;
            display: flex;
            flex-direction: row;
          }

          .container:hover > .permalink {
            visibility: visible;
          }

          .permalink {
            text-align: center;
            vertical-align: middle;
            visibility: hidden;
          }

          .target {
            display: block;
            margin-top: -100px;
            visibility: hidden;
          }

          @media screen and (max-width: ${Constants.breakpoints.mobile}) {
            .container {
              margin-left: 0px;
            }
            .permalink {
              margin-left: -20px;
              padding-left: 5px;
            }
          }
        `}
      </style>
    </Permalink>
  );
};

export default fn;
