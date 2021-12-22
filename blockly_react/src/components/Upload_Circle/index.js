import React from 'react'
import PropTypes from 'prop-types'
import './Upload_Circle.scss'
import Button from '../Button'
import svg_dictionary from '../svg_dictionary'
function index(props) {



  return (
    <div id="upload-container">
      {svg_dictionary.upload_circle}
      <div id="selected-device">
        {props.children}
      </div>

      <div className="device-add-button">
        <Button
          id="device-add-button"
          type="DeviceAddButton"
          outColor="#0000bc"
          hoverColor="#0000aa"
          hoverEffect="svg-fill"
          onClick={props.onClick}
        />
      </div>

    </div>
  )
}

index.propTypes = {

}

export default index

