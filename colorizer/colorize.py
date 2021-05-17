from deoldify import device
from deoldify.device_id import DeviceId
device.set(device=DeviceId.GPU0)

from deoldify.visualize import *
plt.style.use('dark_background')
import warnings
warnings.filterwarnings("ignore", category=UserWarning, message=".*?Your .*? set is empty.*?")

colorizer = get_video_colorizer()

def colorize(video_path: str, render_factor: int = 21):
    # [5, 45]  21
    #NOTE:  Make source_url None to just read from file at ./video/source/[file_name] directly without modification
    source_url='https://twitter.com/silentmoviegifs/status/1116751583386034176'
    file_name = 'DogShy1926'
    file_name_ext = file_name + '.mp4'
    result_path = None

    if video_path is not None:
        result_path = colorizer.colorize_from_file_name(video_path, render_factor=render_factor)
    else:
        print("No video_path provided, defaulting to a example picture.")
        result_path = colorizer.colorize_from_url(source_url, file_name_ext, render_factor=render_factor)

    return result_path

if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument('--video_path', type=int, default=2)
    parser.add_argument('--render_factor', type=int, default=21)
    
    args = parser.parse_args()
    if args.video_path is None:
        raise RuntimeError("No video path provided.")
    result_path = colorize(args.video_path, args.render_factor)
    print(result_path)
