# Financial-Mathematics-Timeline-Plots-with-ggplot2
A function that uses the ggplot2 package, that plots timeline diagrams used for the study of Financial Mathematics.

The function Timeline(TimePoints, PaymentTime, PaymentAmount, Colour, ArrowColour, FontSize) accepts the following parameters:

- TimePoints: This is a vector with the time values (or points) that are going to be displayed in the horizontal axis of the timeline diagram.

- PaymentTime: This is a vector with the time values at which their is going to be a payment. These will be represented by vertical downward arrows in the timeline diagram. Note that PaymentTime must be a subset of the vector TimePoints.

- PaymentAmount: This is a vector with the amount of each payment. This will determine the labels above each arrow on the timeline diagram. Note that the length of the PaymentAmount vector must be equal to the PaymentTime vector.

- Colour: This determines the colour of the payment amounts labelled on the timeline diagram.

- ArrowColour: This determines the colour of the vertical downward arrows of the timeline diagram.

- FontSize: This determines the font size of the payment amount labels. An appropriate range of values is: 2-5. The values 2.5 and 3 should work fine the majority of timeline diagrams.
