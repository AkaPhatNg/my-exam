import React from 'react'
import { StarIcon } from '@heroicons/react/24/solid'

// MyClip.json
const MyClip = [
    {
        "title": "Video",
        "desc": "Description for video 1",
        "url": "https://youtu.be/30KI5SuECuc?si=xe1BU_gGPlsMP5e4"
    },
    {
        "title": "Video 1",
        "desc": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus facilisis tortor vel risus aliquam maximus. Nunc cursus tristique nisi faucibus pretium. Vivamus consectetur metus eu ex mattis, in maximus nibh vehicula. Cras sodales quam sit amet porta faucibus. Suspendisse aliquet lacus et luctus iaculis. Pellentesque accumsan tortor nec lacus iaculis, vel tempus nulla volutpat. Praesent interdum ac tellus eu blandit. Vestibulum id odio luctus velit aliquam lacinia eget sed justo.",
        "url": "https://youtu.be/fArpx8TRWU8?si=J78op4mDKx4rrm1r"
    },
    {
        "title": "Video 2",
        "desc": "Donec sit amet velit pulvinar, ultricies eros vel, varius nibh. Praesent euismod ligula eu magna bibendum consequat. In varius sed justo sit amet condimentum. Aenean scelerisque augue mattis sapien posuere malesuada. Etiam vel dolor diam. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vivamus consectetur gravida volutpat.",
        "url": "https://youtu.be/fTXd-DpN3AI?si=d7cll9xSvg7W_5TD"
    },
    {
        "title": "Video 3",
        "desc": "Praesent tincidunt vulputate mauris, sed porta diam vestibulum id. Sed ornare vel ipsum vel tincidunt. Aenean turpis lorem, lobortis non quam eget, facilisis venenatis metus. Maecenas elit sapien, commodo ut varius eu, porta in nibh. Curabitur porta nunc id justo vestibulum dictum. Suspendisse ornare pellentesque semper. Curabitur ut lorem tincidunt, viverra elit eu, luctus diam.",
        "url": "https://youtu.be/SeWt7IpZ0CA?si=A5KLBOOvLi2CXkdl"
    },
    {
        "title": "Video 4",
        "desc": "Proin elementum venenatis nisl, a lacinia nisi vulputate eu. Suspendisse accumsan aliquam luctus. Aenean efficitur euismod enim, at efficitur felis fringilla eu. Duis placerat nulla id orci pellentesque, vel ullamcorper ante blandit. Donec dignissim nulla id metus tempus fringilla. Praesent efficitur dolor erat. Cras odio neque, fringilla vel augue at, blandit dictum ante.",
        "url": "https://youtu.be/0xAW6MAT_Wo?si=AlAJ2VLNjDkCNfMe"
    }
]

const video = () => {
    const convertToEmbedUrl = (url) => url.replace("youtu.be/", "youtube.com/embed/").split('?')[0];
    return (
        <div className='pt-10 container mx-auto px-20 text-center'>
            <h1 className='font-bold text-blue-800 text-2xl'>My clip</h1>
            <div className="mt-5 flex justify-center">
                <iframe
                    width="720"
                    height="405"
                    src={convertToEmbedUrl(MyClip[0].url)}
                    title={MyClip[0].title}
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                    allowFullScreen
                ></iframe>
            </div>
            <div className="mt-14 grid sm:grid-cols-1 lg:grid-cols-2 gap-4">
                {MyClip.slice(1, 5).map((video, index) => (
                    <div key={index} className="p-4">
                        <iframe
                            width="100%"
                            height="315"
                            src={convertToEmbedUrl(video.url)}
                            title={video.title}
                            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                            allowFullScreen
                        ></iframe>
                        <div className="flex items-center justify-between mt-2">
                            <h2 className="font-bold text-lg">{video.title}</h2>
                            <div className="flex items-center">
                                {[...Array(3)].map((_, i) => (
                                    <StarIcon key={i} className="size-7 text-yellow-500" />
                                ))}
                            </div>
                        </div>
                        <p className="mt-1 text-start">{video.desc}</p>
                    </div>
                ))}
            </div>
        </div>
    )
}

export default video