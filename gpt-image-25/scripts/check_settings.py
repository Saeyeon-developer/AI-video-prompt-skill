"""Check documented GPT Image 2.6 still-image API settings offline."""

import argparse
import json
import re


MODELS = ("gpt-image-2.6-flare", "gpt-image-2.6-sunburst")
DOCUMENTED_SIZES = {"1024x1024", "1536x1024", "1024x1536", "1536x864"}


def check_settings(
    size="auto", background="auto", output_format="png", *,
    operation="generate", output_compression=None,
):
    errors, warnings = [], []
    if size != "auto":
        match = re.fullmatch(r"([1-9][0-9]*)x([1-9][0-9]*)", size)
        if not match:
            errors.append("size must be auto or WIDTHxHEIGHT with positive integers.")
        else:
            width, height = map(int, match.groups())
            if width % 16 or height % 16:
                errors.append("Both edges must be multiples of 16.")
            if max(width, height) > 3 * min(width, height):
                errors.append("The longer-to-shorter edge ratio must not exceed 3:1.")
            if not errors and size not in DOCUMENTED_SIZES:
                warnings.append("Verify this custom size against the selected model's current limits.")
    if output_format == "svg" and operation != "generate":
        errors.append("SVG output requires the generate operation.")
    if background == "transparent" and output_format == "jpeg":
        errors.append("For transparent raster output, use PNG or WebP.")
    if output_compression is not None:
        if output_format not in ("jpeg", "webp"):
            errors.append("Use output_compression only for JPEG or WebP.")
        elif not 0 <= output_compression <= 100:
            errors.append("output_compression must be between 0 and 100.")
    return {"valid": not errors, "errors": errors, "warnings": warnings}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--size", default="auto")
    parser.add_argument("--model", choices=MODELS)
    parser.add_argument("--quality", choices=["auto", "low", "medium", "high", "xhigh", "max"], default="auto")
    parser.add_argument("--complexity", choices=["low", "medium", "high"])
    parser.add_argument("--operation", choices=["generate", "edit"], default="generate")
    parser.add_argument("--background", choices=["auto", "opaque", "transparent"], default="auto")
    parser.add_argument("--output-format", choices=["png", "jpeg", "webp", "svg"], default="png")
    parser.add_argument("--output-compression", type=int)
    args = parser.parse_args()
    result = check_settings(
        args.size, args.background, args.output_format,
        operation=args.operation, output_compression=args.output_compression,
    )
    print(json.dumps(result, ensure_ascii=False, indent=2))
    return 0 if result["valid"] else 1


if __name__ == "__main__":
    raise SystemExit(main())
