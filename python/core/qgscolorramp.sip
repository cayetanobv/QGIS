/************************************************************************
 * This file has been generated automatically from                      *
 *                                                                      *
 * src/core/qgscolorramp.h                                              *
 *                                                                      *
 * Do not edit manually ! Edit header and run scripts/sipify.pl again   *
 ************************************************************************/



class QgsColorRamp
{
%Docstring
 Abstract base class for color ramps
.. versionadded:: 3.0
%End

%TypeHeaderCode
#include "qgscolorramp.h"
%End
%ConvertToSubClassCode
    if ( sipCpp->type() == "gradient" )
      sipType = sipType_QgsGradientColorRamp;
    else if ( sipCpp->type() == "random" )
      sipType = sipType_QgsLimitedRandomColorRamp;
    else if ( sipCpp->type() == "randomcolors" )
      sipType = sipType_QgsRandomColorRamp;
    else if ( sipCpp->type() == "preset" )
      sipType = sipType_QgsPresetSchemeColorRamp;
    else if ( sipCpp->type() == "colorbrewer" )
      sipType = sipType_QgsColorBrewerColorRamp;
    else if ( sipCpp->type() == "cpt-city" )
      sipType = sipType_QgsCptCityColorRamp;
    else
      sipType = 0;
%End
  public:

    virtual ~QgsColorRamp();

    virtual int count() const = 0;
%Docstring
 Returns number of defined colors, or -1 if undefined
 :rtype: int
%End

    virtual double value( int index ) const = 0;
%Docstring
 Returns relative value between [0,1] of color at specified index
 :rtype: float
%End

    virtual QColor color( double value ) const = 0;
%Docstring
 Returns the color corresponding to a specified value.
 \param value value between [0, 1] inclusive
 :return: color for value
 :rtype: QColor
%End

    virtual QString type() const = 0;
%Docstring
 Returns a string representing the color ramp type.
 :rtype: str
%End


    virtual void invert();
%Docstring
 Inverts the ordering of the color ramp.
%End

    virtual QgsColorRamp *clone() const = 0 /Factory/;
%Docstring
 Creates a clone of the color ramp.
 :rtype: QgsColorRamp
%End

    virtual QgsStringMap properties() const = 0;
%Docstring
 Returns a string map containing all the color ramp's properties.
 :rtype: QgsStringMap
%End
};

class QgsGradientStop
{
%Docstring
 Represents a color stop within a QgsGradientColorRamp color ramp.
.. versionadded:: 3.0
%End

%TypeHeaderCode
#include "qgscolorramp.h"
%End
  public:

    QgsGradientStop( double offset, const QColor &color );
%Docstring
 Constructor for QgsGradientStop
 \param offset positional offset for stop, between 0 and 1.0
 \param color color for stop
%End

    double offset;
%Docstring
Relative positional offset, between 0 and 1
%End
    QColor color;
%Docstring
Gradient color at stop
%End

    bool operator==( const QgsGradientStop &other ) const;
%Docstring
 :rtype: bool
%End
};

typedef QList<QgsGradientStop> QgsGradientStopsList;


class QgsGradientColorRamp : QgsColorRamp
{
%Docstring
 Gradient color ramp, which smoothly interpolates between two colors and also
 supports optional extra color stops.
.. versionadded:: 3.0
%End

%TypeHeaderCode
#include "qgscolorramp.h"
%End
  public:

    QgsGradientColorRamp( const QColor &color1 = DEFAULT_GRADIENT_COLOR1,
                          const QColor &color2 = DEFAULT_GRADIENT_COLOR2,
                          bool discrete = false,
                          const QgsGradientStopsList &stops = QgsGradientStopsList() );
%Docstring
 Constructor for QgsGradientColorRamp
 \param color1 start color, corresponding to a position of 0.0
 \param color2 end color, corresponding to a position of 1.0
 \param discrete set to true for discrete interpolation instead of smoothly
 interpolating between colors
 \param stops optional list of additional color stops
%End

    static QgsColorRamp *create( const QgsStringMap &properties = QgsStringMap() );
%Docstring
Creates a new QgsColorRamp from a map of properties
 :rtype: QgsColorRamp
%End

    virtual int count() const;
%Docstring
 :rtype: int
%End
    virtual double value( int index ) const;
%Docstring
 :rtype: float
%End
    virtual QColor color( double value ) const;
%Docstring
 :rtype: QColor
%End
    virtual QString type() const;
%Docstring
 :rtype: str
%End
    virtual void invert();
    virtual QgsGradientColorRamp *clone() const;
%Docstring
 :rtype: QgsGradientColorRamp
%End
    virtual QgsStringMap properties() const;
%Docstring
 :rtype: QgsStringMap
%End

    QColor color1() const;
%Docstring
 Returns the gradient start color.
 \see setColor1()
 \see color2()
 :rtype: QColor
%End

    QColor color2() const;
%Docstring
 Returns the gradient end color.
 \see setColor2()
 \see color1()
 :rtype: QColor
%End

    void setColor1( const QColor &color );
%Docstring
 Sets the gradient start color.
 \param color start color
 \see color1()
 \see setColor2()
%End

    void setColor2( const QColor &color );
%Docstring
 Sets the gradient end color.
 \param color end color
 \see color2()
 \see setColor1()
%End

    bool isDiscrete() const;
%Docstring
 Returns true if the gradient is using discrete interpolation, rather than
 smoothly interpolating between colors.
 \see setDiscrete()
 :rtype: bool
%End

    void setDiscrete( bool discrete );
%Docstring
 Sets whether the gradient should use discrete interpolation, rather than
 smoothly interpolating between colors.
 \param discrete set to true to use discrete interpolation
 \see convertToDiscrete()
 \see isDiscrete()
%End

    void convertToDiscrete( bool discrete );
%Docstring
 Converts a gradient with existing color stops to or from discrete
 interpolation.
 \param discrete set to true to convert the gradient stops to discrete,
 or false to convert them to smooth interpolation
 \see isDiscrete()
%End

    void setStops( const QgsGradientStopsList &stops );
%Docstring
 Sets the list of intermediate gradient stops for the ramp.
 \param stops list of stops. Any existing color stops will be replaced. The stop
 list will be automatically reordered so that stops are listed in ascending offset
 order.
 \see stops()
%End

    QgsGradientStopsList stops() const;
%Docstring
 Returns the list of intermediate gradient stops for the ramp.
 \see setStops()
 :rtype: QgsGradientStopsList
%End

    QgsStringMap info() const;
%Docstring
 Returns any additional info attached to the gradient ramp (e.g., authorship notes)
 \see setInfo()
 :rtype: QgsStringMap
%End

    void setInfo( const QgsStringMap &info );
%Docstring
 Sets additional info to attach to the gradient ramp (e.g., authorship notes)
 \param info map of string info to attach
 \see info()
%End

    void addStopsToGradient( QGradient *gradient, double alpha = 1 );
%Docstring
 Copy color ramp stops to a QGradient
 \param gradient gradient to copy stops into
 \param alpha alpha multiplier. Opacity of colors will be multiplied
 by this factor before adding to the gradient.
.. versionadded:: 2.1
%End

  protected:
};


class QgsLimitedRandomColorRamp : QgsColorRamp
{
%Docstring
 Constrained random color ramp, which returns random colors based on preset parameters.
.. versionadded:: 3.0
%End

%TypeHeaderCode
#include "qgscolorramp.h"
%End
  public:

    QgsLimitedRandomColorRamp( int count = DEFAULT_RANDOM_COUNT,
                               int hueMin = DEFAULT_RANDOM_HUE_MIN, int hueMax = DEFAULT_RANDOM_HUE_MAX,
                               int satMin = DEFAULT_RANDOM_SAT_MIN, int satMax = DEFAULT_RANDOM_SAT_MAX,
                               int valMin = DEFAULT_RANDOM_VAL_MIN, int valMax = DEFAULT_RANDOM_VAL_MAX );
%Docstring
 Constructor for QgsLimitedRandomColorRamp
 \param count number of colors in ramp
 \param hueMin minimum hue
 \param hueMax maximum hue
 \param satMin minimum saturation
 \param satMax maximum saturation
 \param valMin minimum color value
 \param valMax maximum color value
%End

    static QgsColorRamp *create( const QgsStringMap &properties = QgsStringMap() ) /Factory/;
%Docstring
 Returns a new QgsLimitedRandomColorRamp color ramp created using the properties encoded in a string
 map.
 \param properties color ramp properties
 \see properties()
 :rtype: QgsColorRamp
%End

    virtual double value( int index ) const;
%Docstring
 :rtype: float
%End
    virtual QColor color( double value ) const;
%Docstring
 :rtype: QColor
%End
    virtual QString type() const;
%Docstring
 :rtype: str
%End
    virtual QgsLimitedRandomColorRamp *clone() const /Factory/;
%Docstring
 :rtype: QgsLimitedRandomColorRamp
%End
    virtual QgsStringMap properties() const;
%Docstring
 :rtype: QgsStringMap
%End
    int count() const;
%Docstring
 :rtype: int
%End

    static QList<QColor> randomColors( int count,
                                       int hueMax = DEFAULT_RANDOM_HUE_MAX, int hueMin = DEFAULT_RANDOM_HUE_MIN,
                                       int satMax = DEFAULT_RANDOM_SAT_MAX, int satMin = DEFAULT_RANDOM_SAT_MIN,
                                       int valMax = DEFAULT_RANDOM_VAL_MAX, int valMin = DEFAULT_RANDOM_VAL_MIN );
%Docstring
 Get a list of random colors
.. versionadded:: 2.4
 :rtype: list of QColor
%End

    void updateColors();
%Docstring
 Must be called after changing the properties of the color ramp
 to regenerate the list of random colors.
%End

    int hueMin() const;
%Docstring
 Returns the minimum hue for generated colors
 \see setHueMin()
 :rtype: int
%End

    int hueMax() const;
%Docstring
 Returns the maximum hue for generated colors
 \see setHueMax()
 :rtype: int
%End

    int satMin() const;
%Docstring
 Returns the minimum saturation for generated colors
 \see setSatMin()
 :rtype: int
%End

    int satMax() const;
%Docstring
 Returns the maximum saturation for generated colors
 \see setSatMax()
 :rtype: int
%End

    int valMin() const;
%Docstring
 Returns the minimum value for generated colors
 \see setValMin()
 :rtype: int
%End

    int valMax() const;
%Docstring
 Returns the maximum value for generated colors
 \see setValMax()
 :rtype: int
%End

    void setCount( int val );
%Docstring
 Sets the number of colors contained in the ramp.
%End

    void setHueMin( int val );
%Docstring
 Sets the minimum hue for generated colors
 \see hueMin()
%End

    void setHueMax( int val );
%Docstring
 Sets the maximum hue for generated colors
 \see hueMax()
%End

    void setSatMin( int val );
%Docstring
 Sets the minimum saturation for generated colors
 \see satMin()
%End

    void setSatMax( int val );
%Docstring
 Sets the maximum saturation for generated colors
 \see satMax()
%End

    void setValMin( int val );
%Docstring
 Sets the minimum value for generated colors
 \see valMin()
%End

    void setValMax( int val );
%Docstring
 Sets the maximum value for generated colors
 \see valMax()
%End

  protected:
};

class QgsRandomColorRamp: QgsColorRamp
{
%Docstring
 Totally random color ramp. Returns colors generated at random, but constrained
 to some hardcoded saturation and value ranges to prevent ugly color generation.
.. versionadded:: 3.0
%End

%TypeHeaderCode
#include "qgscolorramp.h"
%End
  public:
    QgsRandomColorRamp();

    int count() const;
%Docstring
 :rtype: int
%End

    double value( int index ) const;
%Docstring
 :rtype: float
%End

    QColor color( double value ) const;
%Docstring
 :rtype: QColor
%End

    virtual void setTotalColorCount( const int colorCount );
%Docstring
 Sets the desired total number of unique colors for the resultant ramp. Calling
 this method pregenerates a set of visually distinct colors which are returned
 by subsequent calls to color().
 \param colorCount number of unique colors
.. versionadded:: 2.5
%End

    QString type() const;
%Docstring
 :rtype: str
%End

    virtual QgsRandomColorRamp *clone() const /Factory/;
%Docstring
 :rtype: QgsRandomColorRamp
%End

    virtual QgsStringMap properties() const;
%Docstring
 :rtype: QgsStringMap
%End

  protected:


};


class QgsPresetSchemeColorRamp : QgsColorRamp, QgsColorScheme
{
%Docstring
 A scheme based color ramp consisting of a list of predefined colors.
.. versionadded:: 3.0
%End

%TypeHeaderCode
#include "qgscolorramp.h"
%End
  public:

    QgsPresetSchemeColorRamp( const QList< QColor > &colors = QList< QColor >() );
%Docstring
 Constructor for QgsPresetSchemeColorRamp.
 \param colors list of colors in ramp
%End

    QgsPresetSchemeColorRamp( const QgsNamedColorList &colors );
%Docstring
 Constructor for QgsPresetColorRamp.
 \param colors list of named colors in ramp
.. note::

   not available in Python bindings - use setColors instead
%End

    static QgsColorRamp *create( const QgsStringMap &properties = QgsStringMap() );
%Docstring
 Returns a new QgsPresetSchemeColorRamp color ramp created using the properties encoded in a string
 map.
 \param properties color ramp properties
 \see properties()
 :rtype: QgsColorRamp
%End

    bool setColors( const QgsNamedColorList &colors, const QString & = QString(), const QColor & = QColor() );
%Docstring
 Sets the list of colors used by the ramp.
 \param colors list of colors
 \see colors()
 :rtype: bool
%End

    QList< QColor > colors() const;
%Docstring
 Returns the list of colors used by the ramp.
 \see setColors()
 :rtype: list of QColor
%End

    virtual double value( int index ) const;
%Docstring
QgsColorRamp interface
 :rtype: float
%End
    virtual QColor color( double value ) const;
%Docstring
 :rtype: QColor
%End
    virtual QString type() const;
%Docstring
 :rtype: str
%End
    virtual void invert();
    virtual QgsPresetSchemeColorRamp *clone() const /Factory/;
%Docstring
 :rtype: QgsPresetSchemeColorRamp
%End
    virtual QgsStringMap properties() const;
%Docstring
 :rtype: QgsStringMap
%End
    int count() const;
%Docstring
 :rtype: int
%End

    QString schemeName() const;
%Docstring
QgsColorScheme interface
 :rtype: str
%End
    QgsNamedColorList fetchColors( const QString &context = QString(),
                                   const QColor &baseColor = QColor() );
%Docstring
 :rtype: QgsNamedColorList
%End
    bool isEditable() const;
%Docstring
 :rtype: bool
%End

};



class QgsColorBrewerColorRamp : QgsColorRamp
{
%Docstring
 Color ramp utilising "Color Brewer" preset color schemes.
.. versionadded:: 3.0
%End

%TypeHeaderCode
#include "qgscolorramp.h"
%End
  public:

    QgsColorBrewerColorRamp( const QString &schemeName = DEFAULT_COLORBREWER_SCHEMENAME,
                             int colors = DEFAULT_COLORBREWER_COLORS,
                             bool inverted = false );
%Docstring
 Constructor for QgsColorBrewerColorRamp
 \param schemeName color brewer scheme name
 \param colors number of colors in ramp
 \param inverted invert ramp ordering
%End

    static QgsColorRamp *create( const QgsStringMap &properties = QgsStringMap() );
%Docstring
 Returns a new QgsColorBrewerColorRamp color ramp created using the properties encoded in a string
 map.
 \param properties color ramp properties
 \see properties()
 :rtype: QgsColorRamp
%End

    virtual double value( int index ) const;
%Docstring
 :rtype: float
%End
    virtual QColor color( double value ) const;
%Docstring
 :rtype: QColor
%End
    virtual QString type() const;
%Docstring
 :rtype: str
%End
    virtual void invert();
    virtual QgsColorBrewerColorRamp *clone() const /Factory/;
%Docstring
 :rtype: QgsColorBrewerColorRamp
%End
    virtual QgsStringMap properties() const;
%Docstring
 :rtype: QgsStringMap
%End
    virtual int count() const;
%Docstring
 :rtype: int
%End

    QString schemeName() const;
%Docstring
 Returns the name of the color brewer color scheme.
 \see setSchemeName()
 :rtype: str
%End

    int colors() const;
%Docstring
 Returns the number of colors in the ramp.
 \see setColors()
 :rtype: int
%End

    void setSchemeName( const QString &schemeName );
%Docstring
 Sets the name of the color brewer color scheme.
 \param schemeName scheme name, must match a valid color brewer scheme name
 \see schemeName()
 \see listSchemeNames()
%End

    void setColors( int colors );
%Docstring
 Sets the number of colors in the ramp.
 \param colors number of colors. Must match a valid value for the scheme,
 which can be retrieved using listSchemeVariants()
 \see colors()
%End

    static QStringList listSchemeNames();
%Docstring
 Returns a list of all valid color brewer scheme names.
 \see listSchemeVariants()
 :rtype: list of str
%End

    static QList<int> listSchemeVariants( const QString &schemeName );
%Docstring
 Returns a list of the valid variants (numbers of colors) for a specified
 color brewer scheme name
 \param schemeName color brewer scheme name
 \see listSchemeNames()
 :rtype: list of int
%End

  protected:

    void loadPalette();
%Docstring
Generates the scheme using the current name and number of colors
%End

};



class QgsCptCityColorRamp : QgsGradientColorRamp
{

%TypeHeaderCode
#include "qgscolorramp.h"
%End
  public:

    QgsCptCityColorRamp( const QString &schemeName = DEFAULT_CPTCITY_SCHEMENAME,
                         const QString &variantName = DEFAULT_CPTCITY_VARIANTNAME,
                         bool inverted = false,
                         bool doLoadFile = true );
%Docstring
 Constructor for QgsCptCityColorRamp
 \param schemeName cpt-city scheme name
 \param variantName cpt-city variant name
 \param inverted invert ramp ordering
 \param doLoadFile load cpt-city ramp from file
%End

    QgsCptCityColorRamp( const QString &schemeName, const QStringList &variantList,
                         const QString &variantName = QString(), bool inverted = false,
                         bool doLoadFile = true );
%Docstring
 Constructor for QgsCptCityColorRamp
 \param schemeName cpt-city scheme name
 \param variantList cpt-city variant list
 \param variantName cpt-city variant name
 \param inverted invert ramp ordering
 \param doLoadFile load cpt-city ramp from file
%End

    static QgsColorRamp *create( const QgsStringMap &properties = QgsStringMap() );
%Docstring
 :rtype: QgsColorRamp
%End

    virtual QString type() const;
%Docstring
 :rtype: str
%End

    virtual void invert();

    virtual QgsCptCityColorRamp *clone() const /Factory/;
%Docstring
 :rtype: QgsCptCityColorRamp
%End
    void copy( const QgsCptCityColorRamp *other );
    QgsGradientColorRamp *cloneGradientRamp() const /Factory/;
%Docstring
 :rtype: QgsGradientColorRamp
%End

    virtual QgsStringMap properties() const;
%Docstring
 :rtype: QgsStringMap
%End

    QString schemeName() const;
%Docstring
 :rtype: str
%End
    QString variantName() const;
%Docstring
 :rtype: str
%End
    QStringList variantList() const;
%Docstring
 :rtype: list of str
%End

    void setSchemeName( const QString &schemeName );
%Docstring
lazy loading - have to call loadPalette() explicitly
%End
    void setVariantName( const QString &variantName );
    void setVariantList( const QStringList &variantList );
    void setName( const QString &schemeName, const QString &variantName = "", const QStringList &variantList = QStringList() );

    void loadPalette();
    bool hasMultiStops() const;
%Docstring
 :rtype: bool
%End

    QString fileName() const;
%Docstring
 :rtype: str
%End
    bool loadFile();
%Docstring
 :rtype: bool
%End
    bool fileLoaded() const;
%Docstring
 :rtype: bool
%End

    QString copyingFileName() const;
%Docstring
 :rtype: str
%End
    QString descFileName() const;
%Docstring
 :rtype: str
%End
    QgsStringMap copyingInfo() const;
%Docstring
 :rtype: QgsStringMap
%End

  protected:

};


/************************************************************************
 * This file has been generated automatically from                      *
 *                                                                      *
 * src/core/qgscolorramp.h                                              *
 *                                                                      *
 * Do not edit manually ! Edit header and run scripts/sipify.pl again   *
 ************************************************************************/
