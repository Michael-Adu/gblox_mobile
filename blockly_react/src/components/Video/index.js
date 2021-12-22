import React, { useState, useEffect, useContext } from 'react';
import loading from './loading.mp4';

const Index = () => {

    useEffect(() => {
        console.log("Video Loaded")
    },[])
    return (
        <video
            autoPlay
            loop
            src={loading}
            preload={'auto'}
            id="loading-video-container"
        />
    )
}

export default Index
