#ifndef SINBAD_TOON_INCLUDED
#define SINBAD_TOON_INCLUDED

// Turn range 0-1 into discrete values, with tolerance smooth transition
half SinbadToon(half input, half tolerance)
{
    float shadeWidth = max(fwidth(input), tolerance);

    float2 shadeOffset = 0.5 + float2(-shadeWidth, shadeWidth); 
    half sum = input;
    sum = smoothstep(shadeOffset.x, shadeOffset.y, sum); 
    sum += floor(input);

    // Hack to make the middle sharper
    //half sum2 = saturate(sum * 2 - 1);

    return sum;
}

#endif
