import re
from collections import namedtuple
import os
import sys
import logging

# LOGGER = logging.getLogger(__name__)
# LOGGER.setLevel(logging.DEBUG)


SubmissionDetail = namedtuple(
    "SubmissionDetail",
    ["attempt_no", "student_no", "last_name", "first_name", "submission_code"],
)


def get_new_submission_name(original_submission_detail: SubmissionDetail) -> str:
    """
    Get new submssion details name with the proper user name and student number
    """
    return "{attempt_no}_{student_no}{last_name}{first_name}{submission_code}".format(
        attempt_no=original_submission_detail.attempt_no,
        student_no=os.getenv("PE_PY_IT_STUDENT_NO"),
        last_name=os.getenv("PE_PY_IT_STUDENT_LAST_NAME"),
        first_name=os.getenv("PE_PY_IT_STUDENT_FIRST_NAME"),
        submission_code=original_submission_detail.submission_code,
    )


def get_submission_details(input_str: str) -> SubmissionDetail:
    """
    Extract submission details like:
    - The 'nth_attempt' from 'input_str'
    - 'student_no' 
    - the 'input_str' 'first_name' and 'last_name'
    - 'submission_code' itself

    Args:
        input_str (str):  The input string from which the details will be extracted
    """
    submission_filename_pattern = (
        r"(\d{1})_(\d{5,6})([A-Z]{1}[a-z]+)([A-Z]{1}[a-z]+)([A-Z]+\w+)"
    )
    match = re.match(pattern=submission_filename_pattern, string=input_str)

    # Extract components from the match object
    # Perform regex substitution
    result = SubmissionDetail(*match.groups()) if match else None
    return result


if __name__ == "__main__":

    # Read input from stdin
    # input_str = sys.stdin.read()
    # input_str = input()
    if len(sys.argv) > 1:
        input_str = sys.argv[1]
    else:
        print("No input received")

    original_submission_details = get_submission_details(input_str)
    new_submission_name = input_str
    if original_submission_details:
        new_submission_name = get_new_submission_name(original_submission_details)

        # returns the new submission name
    print(new_submission_name)
