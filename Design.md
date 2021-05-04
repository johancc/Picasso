# Picasso

## Motive

Picasso addresses the image colorization problem in the context of video restoration. 

## Architecture

Picasso will leverage [Instance-Aware Image Colorization (Su, et al)](papers/InstColorization.pdf) and [Temporal Denoising Mark Sythesis](papers/TDMS.pdf) to time-cohorent colorized videos. 

To fuse both of the networks, we will split video inference into two phases - colorization and video creation. Since the TDMS network is model-agnostic, we can feed in series of frames to TDMS to create the final output. To ensure time-coherence, TDMS uses a FlowNet to take into mitigate flickering video through optimal flow. Since TDMS uses a two frame window to create a consistent frame, we will have to ensure that the colorization finishes before the video creation step, or at least that there is a two frame buffer.

## Dataset 

TBD - most likely the COCO or ImageNet dataset.

## Testing Strategy

Since image-colorization is an ill-posed problem, we will follow the same testing method used in Instance-Aware Image Colorization. By sampling random sets of images from our validation set, we will perform a blind human study to gauge the credibility of the colorization. 

The testing strategy for video consistency is still to be determined, but it will focus on the amout of flickering precent in the final output. 
